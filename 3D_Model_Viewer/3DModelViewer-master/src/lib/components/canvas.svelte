<script>
 import * as THREE from 'three';
 import { onMount } from 'svelte';
 import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
 import { STLLoader } from 'three/addons/loaders/STLLoader.js';
 import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
 import { PLYLoader } from 'three/addons/loaders/PLYLoader.js';
 import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
 import * as anno from "$lib/components/notes2.svelte";


 //for passing in the model for the url
 let { generateThumbnail,
     currPoint = $bindable(),
     notes = $bindable(),
     width,
     height,
     src = '/static/models/compat/test.stl',
     editMode,
     addingNode = $bindable(),
     annotations
     } = $props();

 let drawCanvas;
 let controlEl;

 console.log({notes});

 const selected = new THREE.PointsMaterial( {size: 0.1, color: 0xff0000} );
 const deselected = new THREE.PointsMaterial( {size: 0.1, color: 0x88cc55} );

 async function renderToImage(domElement, src, overwrite) {
     const imgData = domElement.toBlob((blob) => {
         const formData = new FormData();
         formData.append('file', blob);
         formData.append('location', src);
         if(overwrite){ formData.append('overwrite', 'overwrite');}
         fetch('/api/models/savethumb', {
             method: 'POST',
             body: formData
         })
     });

     //console.log(imgData);
     return imgData;
 }

 async function loadModelGeneric(src, scene){
     const extension = src.split('.').pop();
     let loader;
     //material for loading geometry-only models
     const material = new THREE.MeshPhongMaterial({
         color: 0x20AA20,    // greenish
         flatShading: true,
         shininess: 30,
     });

     //loader switch statement
     //all load statements taken from three.js documentation unless stated otherwise
     switch(extension){
         case "gltf":
             //console.log("case gltf");
             loader = new GLTFLoader();
             const gltf = await loader.loadAsync(src);
             scene.add(glb.scene);
             return 0;
         case "glb":
             //console.log("case glb");
             loader = new GLTFLoader();
             const glb = await loader.loadAsync(src);
             scene.add(glb.scene);
             return 0;
         case "stl":
             loader = new STLLoader();
             const stlGeometry = await loader.loadAsync(src)
             scene.add( new THREE.Mesh( stlGeometry, material) );
             return 0;
         case "obj":
             loader = new OBJLoader();
             const OBJObject = await loader.loadAsync(src);
             scene.add( OBJObject );
             return 0;
         case "ply":
             loader = new PLYLoader();
             const pointsMat = new THREE.PointsMaterial( { size: 0.01, vertexColors: true } );
             const pcdGeometry = await loader.loadAsync( src );
             pcdGeometry.rotateX(180);
             scene.add( new THREE.Points(pcdGeometry, pointsMat));
             return 0;
         default:
             return -1;
     }
 }
 //wrangling annotation points
 function createLinkedNote(scene, vertices, material, title, body){

     //initialize geometry for new note
     const clickGeo = new THREE.BufferGeometry();
     clickGeo.setAttribute( 'position', new THREE.Float32BufferAttribute( vertices, 3) );
     //create new object for new note
     const myNew3dPoint = new THREE.Points(clickGeo, deselected);
     //initialize for nodeSet
     const newNode = new anno.Node(vertices, myNew3dPoint);
     //add to nodeSet
     if(title){
         newNode.header = title;
     }
     if(body){
         newNode.body = body;
     }
     notes.addNode(newNode);
     //add to scene
     console.log(myNew3dPoint); 
     scene.add(myNew3dPoint);

 }

 //handling interaction
 //helper functions courtesy of three.js example "webgl_raycaster_texture"
 function getMousePosition( canvas, x, y ) {
	 const rect = canvas.getBoundingClientRect();
	 return [ ( x - rect.left ) / rect.width, ( y - rect.top ) / rect.height ];
 }
 function getIntersects( point, object, raycaster, camera ) {
     const mouse = new THREE.Vector2();
	 mouse.set( ( point.x * 2 ) - 1, - ( point.y * 2 ) + 1 );
	 raycaster.setFromCamera( mouse, camera );
	 return raycaster.intersectObject( object, true );
 }

 function setAnnotationPoint(canvasElement, scene, raycaster, camera, clientX, clientY, material, selected){
     const mousePos = getMousePosition( canvasElement, clientX, clientY  );
     const onClickPosition = new THREE.Vector3();
     onClickPosition.fromArray( mousePos );
     //console.log(scene);

     const intersects = getIntersects( onClickPosition, scene, raycaster, camera );


     if (intersects.length > 0){
         const vertices = [
             intersects[0].point.x - scene.position.x,
             intersects[0].point.y - scene.position.y,
             intersects[0].point.z - scene.position.z
         ];

         createLinkedNote(scene, vertices, material);
         
     }
 }

 function selectAnnotationPoint(canvasElement, scene, raycaster, camera, clientX, clientY){
     const mousePos = getMousePosition( canvasElement, clientX, clientY  );
     const onClickPosition = new THREE.Vector3();
     onClickPosition.fromArray( mousePos );

     console.log({onClickPosition, scene, raycaster, camera});
     const intersects = getIntersects( onClickPosition, scene, raycaster, camera );


     if (intersects.length > 0){
         const ptIdx = intersects.findIndex((curr) => curr.object && curr.object.material == deselected && notes.indexOfNode(curr.object) !== null );
         if(ptIdx >= 0){
             const noteIdx = notes.indexOfNode(intersects[ptIdx].object);
             console.log(noteIdx);
             notes.selectNode(noteIdx);
         } else{
             notes.selectNode(null);
         }
     }
         else {
             notes.selectNode(null);
         }
 }

 onMount(async () => {

     //initialize scene, camera, renderer, raycaster
     const scene = new THREE.Scene({alpha: true});
     const raycaster = new THREE.Raycaster();
     const renderer = new THREE.WebGLRenderer({canvas: drawCanvas, preserveDrawingBuffer: true});
     const camera = new THREE.PerspectiveCamera( 75,
                                                 renderer.domElement.width / renderer.domElement.height,
                                                 0.005,
                                                 1000 );
     const controls = new OrbitControls( camera, controlEl );


     await loadModelGeneric(src, scene);
     
     //center scene
     new THREE.Box3().setFromObject( scene ).getCenter( scene.position ).multiplyScalar( - 1 );

     //get bounding box for scene
     const sceneBounds = new THREE.Sphere();

     new THREE.Box3().setFromObject( scene ).getBoundingSphere(sceneBounds);
     //console.log({sceneBounds});
     const maxDim = (sceneBounds.radius * 2);
     //console.log({maxDim});

     const pointSize = (src.split('.').pop() == 'ply') ? 0.05 : sceneBounds.radius / 10;

     raycaster.params.Points.threshold = pointSize;
     selected.size = pointSize;
     deselected.size = pointSize;
     notes.selectedMat = selected;
     notes.defaultMat = deselected;

     //add event handler based on annotation mode
     function onClick(event) {
         console.log({addingNode});
         event.preventDefault();
         //adjust raycaster sensitivitiy for pcl
         if(editMode && addingNode){
             setAnnotationPoint(drawCanvas, scene, raycaster, camera, event.clientX, event.clientY, deselected);
             addingNode = false;
         } else {
             selectAnnotationPoint(drawCanvas, scene, raycaster, camera, event.clientX, event.clientY);
         }
     }

     //fit whole model in fov
     const radians = (camera.fov / 2) * (Math.PI * 2);
     const initialZ = (Math.cos(radians) * maxDim);

     //make it transparent (because it's cool)
     renderer.setClearColor( 0x000000, 0 );

     //hemisphere lighting, taken from three.js getting started guide
     const skyColor = 0xB1E1FF;  // light blue
     const groundColor = 0xB97A20;  // brownish orange
     const intensity = 1.5;
     const light = new THREE.HemisphereLight(skyColor, groundColor, intensity);
     scene.add(light);

     

     controls.autoRotate = true;
     controls.addEventListener('end', () => controls.autoRotate = false);

     camera.position.z = initialZ;



     controls.domElement.addEventListener( 'click', onClick );

     //populate annotations from db via props
     if(annotations){
         const parsedAnnos = JSON.parse(annotations);
         parsedAnnos.map((x)=>{
             createLinkedNote(scene, x.xyz, deselected, x.header, x.body);
         });
         notes.selectNode(null);
     }

     controls.update();
     function animate() {
         controls.update();
         renderer.render( scene, camera );
     }

     if(generateThumbnail){
         renderer.render( scene, camera );
         renderToImage( renderer.domElement, src );
     }

     renderer.setAnimationLoop( animate );

 })
</script>

<div bind:this={controlEl} >
    <canvas class="DrawCanvas" width={width} height={height} bind:this={drawCanvas} ></canvas>
</div>
