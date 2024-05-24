event_inherited()

dialog_tree = {
    text: "",
    options: {
        "Looks like a simple drawer": "[end]"
    }
}

dialog_opened = {
    text: "",
    options: {
        "Let's see what we got here...]": "[end]"
    }
}

function drawerOpen() {
    image_index = 1
    oFamilyPhoto.setActive(true)
    startDialog(dialog_opened)
}

function interact(item) {
    if item.object_index == oDrawerKey {
        drawerOpen()
    }
    instance_destroy(item)
}
