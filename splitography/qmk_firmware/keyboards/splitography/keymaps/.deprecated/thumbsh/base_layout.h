
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// .................................................................. BEAKL HIEA

  // ,-----------------------------------------------------------------------------------.
  // |   Q  |   Y  |   O  |   U  |   Z  |  Fn  | Caps |   G  |   D  |   N  |   M  |   X  |
  // |------+------+------+------+------+-------------+------+------+------+------+------|
  // |   K  |   I  |   E  |   A  |   .  |Cursor| Mouse|   C  |   T  |   R  |   S  |   W  |
  // |------+------+------+------+------+------|------+------+------+------+------+------|
  // |   J  |   ;  |   "  |   H  |   ,  |  Num | Regex|   B  |   P  |   L  |   F  |   V  |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |                           |  Esc | Space|  Ent | Bksp |                           |
  // `-----------------------------------------------------------------------------------'

  [_BASE] = {
    {KC_Q,    KC_Y,    KC_O,    KC_U,    KC_Z,    CNTR_TL, CNTR_TR, KC_G,    KC_D,    KC_N,    KC_M,    KC_X   },
    {HOME_K,  HOME_I,  HOME_E,  HOME_A,  KC_DOT,  CNTR_HL, CNTR_HR, KC_C,    HOME_T,  HOME_R,  HOME_S,  HOME_W },
    {KC_J,    KC_SCLN, TD_QUOT, KC_H,    KC_COMM, CNTR_BL, CNTR_BR, KC_B,    KC_P,    KC_L,    KC_F,    KC_V   },
    {_______, _______, _______, _______, LT_ESC,  TD_SPC,  TD_ENT,  LT_BSPC, _______, _______, _______, _______},
  },

  [_SHIFT] = {
    {S(KC_Q), S(KC_Y), S(KC_O), S(KC_U), S(KC_Z), CNTR_TL, CNTR_TR, S(KC_G), S(KC_D), S(KC_N), S(KC_M), S(KC_X)},
    {S(KC_K), S(KC_I), S(KC_E), S(KC_A), KC_DOT,  CNTR_HL, CNTR_HR, S(KC_C), S(KC_T), S(KC_R), S(KC_S), S(KC_W)},
    {S(KC_J), KC_SCLN, TD_QUOT, S(KC_H), KC_COMM, CNTR_BL, CNTR_BR, S(KC_B), S(KC_P), S(KC_L), S(KC_F), S(KC_V)},
    {_______, _______, _______, _______, LT_ESC,  TD_SPC,  TD_ENT,  LT_BSPC, _______, _______, _______, _______},
  },

  // ,-----------------------------------------------------------------------------------.
  // |   Q  |   Y  |   O  |   U  |   Z  |  Fn  | Caps |   G  |   D  |   N  |   M  |   X  |
  // |------+------+------+------+------+-------------+------+------+------+------+------|
  // |   K  |   I  |   E  |   A  |   ~  |Cursor| Mouse|   C  |   T  |   R  |   S  |   W  |
  // |------+------+------+------+------+------|------+------+------+------+------+------|
  // |   J  |   :  |   "  |   H  |   `  |  Num | Regex|   B  |   P  |   L  |   F  |   V  |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |                           | ↑Tab |  f() |   _  |  Del |                           |
  // `-----------------------------------------------------------------------------------'

  [_LSHIFT] = {
    {S(KC_Q), S(KC_Y), S(KC_O), S(KC_U), S(KC_Z), CNTR_TL, CNTR_TR, S(KC_G), S(KC_D), S(KC_N), S(KC_M), S(KC_X)},
    {S(KC_K), S(KC_I), S(KC_E), S(KC_A), TD_TILD, CNTR_HL, CNTR_HR, S(KC_C), S(KC_T), S(KC_R), S(KC_S), S(KC_W)},
    {S(KC_J), TD_COLN, TD_DQOT, S(KC_H), TD_GRV,  CNTR_BL, CNTR_BR, S(KC_B), S(KC_P), S(KC_L), S(KC_F), S(KC_V)},
    {_______, _______, _______, _______, S_TAB,   ___fn__, KC_UNDS, LT_DEL,  _______, _______, _______, _______},
  },

  // ,-----------------------------------------------------------------------------------.
  // |   Q  |   Y  |   O  |   U  |   Z  |  Fn  | Caps |   G  |   D  |   N  |   M  |   X  |
  // |------+------+------+------+------+-------------+------+------+------+------+------|
  // |   K  |   I  |   E  |   A  |   ?  |Cursor| Mouse|   C  |   T  |   R  |   S  |   W  |
  // |------+------+------+------+------+------|------+------+------+------+------+------|
  // |   J  |   :  |   "  |   H  |   /  |  Num | Regex|   B  |   P  |   L  |   F  |   V  |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |                           |  Tab |   -  |  f() |  Del |                           |
  // `-----------------------------------------------------------------------------------'

  [_RSHIFT] = {
    {S(KC_Q), S(KC_Y), S(KC_O), S(KC_U), S(KC_Z), CNTR_TL, CNTR_TR, S(KC_G), S(KC_D), S(KC_N), S(KC_M), S(KC_X)},
    {S(KC_K), S(KC_I), S(KC_E), S(KC_A), KC_QUES, CNTR_HL, CNTR_HR, S(KC_C), S(KC_T), S(KC_R), S(KC_S), S(KC_W)},
    {S(KC_J), TD_COLN, TD_DQOT, S(KC_H), KC_SLSH, CNTR_BL, CNTR_BR, S(KC_B), S(KC_P), S(KC_L), S(KC_F), S(KC_V)},
    {_______, _______, _______, _______, KC_TAB,  KC_MINS, ___fn__, KC_DEL,  _______, _______, _______, _______},
  },

  // ,-----------------------------------------------------------------------------------.
  // |      |      |      |      |      |      |      |   /  |   [  |   ^  |   ]  |      |
  // |--------------------+---------------------------+------+------+------+------+------|
  // |      |      |      |      |      |      |      |   |  |   (  |   $  |   )  |      |
  // |------|-------------+------|------|-------------+------+------+------+------+------|
  // |      |      |      |      |      |      |      |   \  |   {  |   #  |   }  |      |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |                           |  f() |      |   +  | Bksp |                           |
  // `-----------------------------------------------------------------------------------'

  [_LSYMBOL] = {
    {_______, _______, _______, _______, _______, ___x___, ___x___, KC_SLSH, KC_LBRC, KC_CIRC, KC_RBRC, _______},
    {_______, _______, _______, _______, _______, ___x___, ___x___, KC_PIPE, KC_LPRN, KC_DLR,  KC_RPRN, _______},
    {_______, _______, _______, _______, _______, ___x___, ___x___, KC_BSLS, KC_LCBR, KC_HASH, KC_RCBR, _______},
    {_______, _______, _______, _______, ___fn__, ___x___, KC_PLUS, SL_DEL,  _______, _______, _______, _______},
  },

  // ,-----------------------------------------------------------------------------------.
  // |      |   .  |   *  |   &  |   ~  |      |      |      | Home |  Up  |  End | PgUp |
  // |------+------+------+------+------+------------------------------------------------|
  // |  GUI |   <  |   %  |   >  |   ?  |      |      |      | Left | Down | Right| PgDn |
  // |------+------+------+------+------+------|-----------------------------------------|
  // |      |   :  |   @  |   !  |   /  |      |      |      |      |      |      |      |
  // |------+------+------+------+------+------+-----------------------------------------|
  // |                           | ↑Tab |   =  |      |  f() |                           |
  // `-----------------------------------------------------------------------------------'

  [_RSYMBOL] = {
    {_______, KC_DOT,  KC_ASTR, KC_AMPR, KC_TILD, ___x___, ___x___, _______, KC_HOME, KC_UP,   KC_END,  KC_PGUP},
    {OS_GUI,  TD_LT,   SM_PERC, TD_GT,   KC_QUES, ___x___, ___x___, _______, KC_LEFT, KC_DOWN, KC_RGHT, KC_PGDN},
    {_______, TD_COLN, KC_AT,   KC_EXLM, KC_SLSH, ___x___, ___x___, _______, _______, _______, _______, _______},
    {_______, _______, _______, _______, SL_TAB,  TD_EQL,  ___x___, ___fn__, _______, _______, _______, _______},
  },
