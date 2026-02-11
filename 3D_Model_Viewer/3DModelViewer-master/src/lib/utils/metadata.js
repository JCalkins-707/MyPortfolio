/*
    getTagsFromMetadata(metadata):
        given a json string, should
        return the "Tags" values if any
*/

export function getTagsFromMetadata(metadata) {
    if (!metadata || typeof metadata !== "object") {
        return [];
    }

    if (Array.isArray(metadata.tags)) {
        return metadata.tags;
    }

    return [];
}

/*
    addTagToMetadata(metadata, tag):
        push given tag to the "Tags"
        field of the given metadata json
*/

export function addTagToMetadata(metadata, tag) {
    if (!metadata || typeof metadata !== "object") {
        metadata = {};
    }

    if (!Array.isArray(metadata.tags)) {
        metadata.tags = [];
    }

    if (!metadata.tags.includes(tag)) {
        metadata.tags.push(tag);
    }

    return metadata;
}

/*
    removeTagFromMetadata(metadata, tag):
        if tag is in the "Tags" part of metadata
        json, remove it. 
*/

export function removeTagFromMetadata(metadata, tag) {
    if (!metadata || typeof metadata !== "object") {
        return metadata;
    }

    if (Array.isArray(metadata.tags)) {
        metadata.tags = metadata.tags.filter(t => t !== tag);
    }

    return metadata;
}