#include "m64p_config.h"
#include "m64p_plugin.h"
#include <SDL.h>

enum EButton
{
    R_DPAD          = 0,
    L_DPAD,
    D_DPAD,
    U_DPAD,
    START_BUTTON,
    Z_TRIG,
    B_BUTTON,
    A_BUTTON,
    R_CBUTTON,
    L_CBUTTON,
    D_CBUTTON,
    U_CBUTTON,
    R_TRIG,
    L_TRIG,
    MEMPAK,
    RUMBLEPAK,
    X_AXIS,
    Y_AXIS,
    NUM_BUTTONS
};

typedef struct
{
    int button;         // button index; -1 if notassigned
    SDL_Scancode key;   // sdl keysym; SDL_SCANCODE_UNKNOWN if not assigned
    int axis, axis_dir; // aixs + direction (i.e. 0, 1 = X Axis +; 0, -1 = X Axis -); -1 if notassigned
    int axis_deadzone;  // -1 for default, or >= 0 for custom value
    int hat, hat_pos;   // hat + hat position; -1 if not assigned
    int mouse;          // mouse button
} SButtonMap;

typedef struct
{
    int button_a, button_b;         // up/down or left/right; -1 if not assigned
    SDL_Scancode key_a, key_b;      // up/down or left/right; SDL_SCANCODE_UNKNOWN if not assigned
    int axis_a, axis_b;             // axis index; -1 if not assigned
    int axis_dir_a, axis_dir_b;     // direction (1 = X+, 0, -1 = X-)
    int hat, hat_pos_a, hat_pos_b;  // hat + hat position up/down and left/right; -1 if not assigned
} SAxisMap;

typedef struct
{
    CONTROL *control;               // pointer to CONTROL struct in Core library
    BUTTONS buttons;

    // mappings
    SButtonMap    button[16];       // 14 buttons; in the order of EButton + mempak/rumblepak switches
    SAxisMap      axis[2];          // 2 axis
    int           device;           // joystick device; -1 = keyboard; -2 = none
    int           mouse;            // mouse enabled: 0 = no; 1 = yes
    SDL_Joystick *joystick;         // SDL joystick device
#if SDL_VERSION_ATLEAST(2,0,0)
    SDL_Haptic   *event_joystick;   // the sdl device for force feeback
#else
    int           event_joystick;   // the /dev/input/eventX device for force feeback
#endif
    int           axis_deadzone[2]; // minimum absolute value before analog movement is recognized
    int           axis_peak[2];     // highest analog value returned by SDL, used for scaling
    float         mouse_sens[2];    // mouse sensitivity
} SController;
extern SController controller[4];   // 4 controllers
