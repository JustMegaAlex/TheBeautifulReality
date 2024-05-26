
pull_out_button.step()
prev_page_button.step()
next_page_button.step()

if y < pda_target_y[pda_open] {
    y = min(y + pda_spd, pda_target_y[pda_open])
}
if y > pda_target_y[pda_open] {
    y = max(y - pda_spd, pda_target_y[pda_open])
}
