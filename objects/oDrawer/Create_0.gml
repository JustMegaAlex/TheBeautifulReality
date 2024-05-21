event_inherited()

dialog_tree = {
    text: "",
    options: {
        "Looks like a simple drawer": "[end]"
    }
}

function drawerOpen() {
    image_index = 1
    oFamilyPhoto.setActive(true)
}

function interact(item) {
    if item.object_index == oDrawerKey {
        drawerOpen()
    }
    instance_destroy(item)
}
