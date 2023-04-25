//! Most of this is from https://ziglang.org/documentation/master/

const std = @import("std");
const json = std.json;
const payload =
    \\{
    \\    "vals": {
    \\        "testing": 1,
    \\        "production": 42
    \\    },
    \\    "uptime": 9999
    \\}
;
const Config = struct {
    vals: struct { testing: u8, production: u8 },
    uptime: u64,
};
const config = x: {
    var stream = json.TokenStream.init(payload);
    const res = json.parse(Config, &stream, .{});
    // Assert no error can occur since we are
    // parsing this JSON at comptime!
    break :x res catch unreachable;
};
pub fn main() !void {
    if (config.vals.production > 50) {
        @compileError("only up to 50 supported");
    }
    std.log.info("up={d}", .{config.uptime});
}

const expect = std.testing.expect;
var the_frame: anyframe = undefined;
var result = false;
test "async function suspend with block" {
    _ = async testSuspendBlock();
    try expect(!result);
    resume the_frame;
    try expect(result);
}
fn testSuspendBlock() void {
    suspend {
        comptime try expect(@TypeOf(@frame()) == *@Frame(testSuspendBlock));
        the_frame = @frame();
    }
    result = true;
}
/// Some one should document this thing..
fn iAmCool(no: bool, yes: bool) bool {
    if (no and yes) {
        return no;
    }
    if (yes) {
        return no;
    }
    return !no and !yes;
}
fn doThis() void {
    var nums = [_]u8{ 1, 2, 3 };
    for (nums) |*n| {
        n.* += 42;
    }
}
test "switch on tagged union" {
    const Point = struct {
        x: u8,
        y: u8,
    };
    const Item = union(enum) {
        a: u32,
        c: Point,
        d,
        e: u32,
    };

    var a = Item{ .c = Point{ .x = 1, .y = 2 } };

    // Switching on more complex enums is allowed.
    const b = switch (a) {
        // A capture group is allowed on a match, and will return the enum
        // value matched. If the payload types of both cases are the same
        // they can be put into the same switch prong.
        Item.a, Item.e => |item| item,

        // A reference to the matched value can be obtained using `*` syntax.
        Item.c => |*item| blk: {
            item.*.x += 1;
            break :blk 6;
        },

        // No else is required if the types cases was exhaustively handled
        Item.d => 8,
    };

    try expect(b == 6);
    try expect(a.c.x == 2);
}

// Top-level declarations are order-independent:
const print = std.debug.print;
const std = @import("std"); // error: redeclaration of `std`
const os = std.os;
const assert = std.debug.assert;

pub fn main() void { // error: redeclaration of `main`
    // integers
    const one_plus_one: i32 = 1 + 1;
    print("1 + 1 = {}\n", .{one_plus_one});

    // floats
    const seven_div_three: f32 = 7.0 / 3.0;
    print("7.0 / 3.0 = {}\n", .{seven_div_three});

    // boolean
    print("{}\n{}\n{}\n", .{
        true and false,
        true or false,
        !true,
    });

    // optional
    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);

    print("\noptional 1\ntype: {s}\nvalue: {s}\n", .{
        @typeName(@TypeOf(optional_value)),
        optional_value,
    });

    optional_value = "hi";
    assert(optional_value != null);

    print("\noptional 2\ntype: {s}\nvalue: {s}\n", .{
        @typeName(@TypeOf(optional_value)),
        optional_value,
    });

    // error union
    var number_or_error: anyerror!i32 = error.ArgNotFound;

    print("\nerror union 1\ntype: {s}\nvalue: {}\n", .{
        @typeName(@TypeOf(number_or_error)),
        number_or_error,
    });

    number_or_error = 1234;

    print("\nerror union 2\ntype: {s}\nvalue: {}\n", .{
        @typeName(@TypeOf(number_or_error)),
        number_or_error,
    });
}

pub fn syscall3(number: usize, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("syscall"
        : [ret] "={rax}" (-> usize),
        : [number] "{rax}" (number),
          [arg1] "{rdi}" (arg1),
          [arg2] "{rsi}" (arg2),
          [arg3] "{rdx}" (arg3),
        : "rcx", "r11"
    );
}
