switch room {
    case rmWork:
        switch_music(noone)
    break
    case rmDWBedroom:
        if !audio_is_playing(bgmRadio) {
            switch_music(bgmRadio)
        }
    break
}
