//! NOTE:
//!
//! Maybe have the game state contain a bunch of vectors of all the "components":
//!
//! struct GameState {
//!     physics_components: Vec<Option<PhysicsComponent>>,
//!     humanoid_animation_components: Vec<Option<HumanoidAnimationComponent>>,
//!     heath_components: Vec<Option<HealthComponent>>,
//!     player_components: Vec<Option<PlayerComponent>>
//! }
//!
//! check into `slotmap` crate - generational indexing
//!
//! also checkout `anymap` crate
//!
//! also checkout `specs` create - ecs
//!
//! what is the `actor model`

const SCREEN_WIDTH: i32 = 480;
const SCREEN_HEIGHT: i32 = 640;

use std::time;

use raylib::{Color, Vector2, Texture2D};

// redefine KEY_* consts as i32 for use in rl.is_key_* methods
use raylib::consts;
const KEY_UP: i32 = consts::KEY_UP as i32;
const KEY_DOWN: i32 = consts::KEY_DOWN as i32;
const KEY_LEFT: i32 = consts::KEY_LEFT as i32;
const KEY_RIGHT: i32 = consts::KEY_RIGHT as i32;
const KEY_W: i32 = consts::KEY_W as i32;
const KEY_S: i32 = consts::KEY_S as i32;
const KEY_A: i32 = consts::KEY_A as i32;
const KEY_D: i32 = consts::KEY_D as i32;

trait Cool {
    fn awesome() -> String;
}

#[derive(Default)]
struct InputState<'a> {
    up: bool,
    down: bool,
    left: bool,
    right: bool,
    up_time: time::Instant,
    down_time: time::Instant,
    left_time: time::Instant,
    right_time: time::Instant,
    name: &'a str,
}

impl<'a> InputState<'a> {
    fn new(name: &'a str) -> InputState {
        let n = time::Instant::now();
        InputState {
            up: false,
            down: false,
            left: false,
            right: false,
            up_time: n.clone(),
            down_time: n.clone(),
            left_time: n.clone(),
            right_time: n.clone(),
            name,
        }
    }
}

struct Spaceship {
    pos: Vector2,
    speed: f32,
    img_idx: usize,
    input: InputState,
}

impl Spaceship {
    fn new(pos: Vector2, img_idx: usize) -> Spaceship {
        Spaceship{
            pos,
            speed: 1.0,
            img_idx,
            input: InputState::new(),
        }
    }

    fn draw(&self, rl: &raylib::RaylibHandle, textures: &Vec<Texture2D>) {
        rl.draw_texture(&textures[self.img_idx], self.pos.x as i32, self.pos.y as i32, Color::WHITE);
    }
}

trait Moveable {
    fn update_loc(&mut self, rl: &raylib::RaylibHandle);
}

impl Moveable for Spaceship {
    fn update_loc(&mut self, rl: &raylib::RaylibHandle) {
        // GET MOVEMENT INPUT
        let mut go_up = rl.is_key_down(KEY_UP) || rl.is_key_down(KEY_W);
        let mut go_down = rl.is_key_down(KEY_DOWN) || rl.is_key_down(KEY_S);
        let mut go_left = rl.is_key_down(KEY_LEFT) || rl.is_key_down(KEY_A);
        let mut go_right = rl.is_key_down(KEY_RIGHT) || rl.is_key_down(KEY_D);

        // RESET RELEASED MOVEMENT
        if !go_up {
            self.input.up = false;
        }
        if !go_down {
            self.input.down = false;
        }
        if !go_left {
            self.input.left = false;
        }
        if !go_right {
            self.input.right = false;
        }

        // RECORD START OF MOVEMENT INPUT
        // this is needed for handling conflicts (newer keys take precedence)
        let now = time::Instant::now();
        if !self.input.up && go_up {
            self.input.up = true;
            self.input.up_time = now.clone();
        }
        if !self.input.down && go_down {
            self.input.down = true;
            self.input.down_time = now.clone();
        }
        if !self.input.left && go_left {
            self.input.left = true;
            self.input.left_time = now.clone();
        }
        if !self.input.right && go_right {
            self.input.right = true;
            self.input.right_time = now.clone();
        }

        // HANDLE MOVEMENT INPUT CONFLICTS
        if go_up && go_down {
            if self.input.up_time > self.input.down_time {
                go_down = false;
            } else {
                go_up = false;
            }
        }
        if go_left && go_right {
            if self.input.left_time > self.input.right_time {
                go_right = false;
            } else {
                go_left = false;
            }
        }

        // APPLY MOVEMENT INPUT
        if go_up {
            self.pos.y -= self.speed;
        }
        if go_down {
            self.pos.y += self.speed;
        }
        if go_left {
            self.pos.x -= self.speed;
        }
        if go_right {
            self.pos.x += self.speed;
        }
    }
}

pub fn main() {

    let rl = raylib::init()
        .size(SCREEN_WIDTH, SCREEN_HEIGHT)
        .title("SpaceKing")
        .build();

    let image_paths = vec![
        "assets/agility.png",
        "assets/earth.png",
        "assets/fireball.png",
        "assets/missile.png",
        "assets/spaceship.png",
    ];

    let textures = vec![
        rl.load_texture(image_paths[0]),
        rl.load_texture(image_paths[1]),
        rl.load_texture(image_paths[2]),
        rl.load_texture(image_paths[3]),
        rl.load_texture(image_paths[4]),
    ];

    // load game assets
    let mut s = Spaceship::new(raylib::Vector2::new(0.0, 0.0), 4);

    // init game state

    rl.set_target_fps(60);
    while !rl.window_should_close() {
        // update game objects
        s.update_loc(&rl);

        // drawing
        rl.begin_drawing();

        rl.clear_background(raylib::Color::WHITE);
        rl.draw_text("Hello, world!", 12, 12, 20, raylib::Color::BLACK);
        s.draw(&rl, &textures);

        rl.end_drawing();
    }
}
