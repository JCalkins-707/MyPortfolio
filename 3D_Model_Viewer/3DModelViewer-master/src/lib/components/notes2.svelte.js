//NOTE: It is illegal to use "this." in a lot of cases since this is a reactive class!
//source: svelte docs on state
export class NodeSet {
    type = "NodeSet";
    selectedIdx = $state();
    #nodes = $state([]);
    selectedMat = $state();
    defaultMat = $state();

    constructor(nodelist) {
        console.log("initializing nodeset");
        console.log(this);
        //process nodelist here
    }

    // GETTERS
    //all getters are arrow functions. Because that works for some reason??
    header = () => {
        if(this.selectedNode()[1]){
        return this.selectedNode()[1].header;
        }
    }

    body = () => {
        if(this.selectedNode()[1]){
            return this.selectedNode()[1].body;
        }
    }

    setHeader = (x) => {
        if(this.selectedNode()[1]){
            this.selectedNode()[1].header = x; 
        }
    }

    setBody = (x) => {
        if(this.selectedNode()[1]){
            this.selectedNode()[1].body = x; 
        }
    }

    nodes = () => { //Should be regarded as private - i'm having trouble getting it to be kept private by Svelte's semantics
        return this.#nodes;
    }

    exportList = () =>{
        const outArray = this.#nodes.map((x) => {return {xyz: x.pos, header: x.header, body: x.body};} );
        return JSON.stringify(outArray);
    }

    selectedNode = () => {
        console.log("getter for selectedNode called for idx");
        console.log(this.selectedIdx);
        if (this.selectedIdx !== null) {
            return [this.selectedIdx, this.nodes()[this.selectedIdx]];
        } else {
            return [null, null];
        }
    }

    indexOfNode(point3d) {
        return this.#nodes.findIndex((curr) => curr.point == point3d);
    }

    //methods
    getTitleArray() {
        if (this.#nodes[0]) {
            const initialvalue = [];
            return this.#nodes.map((x) => x.header);
        } else {
            return [];
        }
    }
    addNode(node) {
        this.#nodes.push(node);
        this.selectNode(this.#nodes.length - 1);
    }
    indexOf(searchedNode) {
        return this.#nodes.findIndex((currNode) => currNode == searchedNode);
    }

    selectNode = (idx) => {
        if(this.#nodes.length <= 0) return null;

        console.log("selecting node");
        console.log(idx);
        if (idx >= 0 && idx <= this.#nodes.length - 1) {
            this.selectedIdx = idx;
            console.log(this.selectedIdx);
        } 
        if (this.defaultMat && this.selectedMat) {
            for (const Node in this.#nodes) {
                this.#nodes[Node].point.material = this.defaultMat;
            }
            if (this.selectedIdx !== null){
                this.#nodes[idx].point.material = this.selectedMat;
            } else {
                this.selectedIdx = null;
            }
        }

    }

    removeSelected = () => {
        if (this.selectedIdx !== null) {
            this.selectedNode()[1].point.removeFromParent();
            this.#nodes.splice(this.selectedIdx, 1);
            (this.selectedIdx == 0) ? this.selectedIdx = null : this.selectedIdx--;
        }
    }
}

import * as THREE from 'three';

export class Node {
    pos = null;
    header = null;
    body = null;
    point = null;

    constructor(vec3, point, head, text, pointSize) {
        //add typechecking later
        if (!vec3 || !point) return null;

        this.pos = vec3;
        this.header = "No Title";
        this.body = "No Text";
        this.point = point;
    }
}




