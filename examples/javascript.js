// from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
class Rectangle {
  #height = 0;
  #width;
  constructor(height, width) {
    this.#height = height;
    this.#width = width;
  }

  area() {
    return this.height * this.width;
  }
}

class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  static displayName = "Point";
  static distance(a, b) {
    const dx = a.x - b.x;
    const dy = a.y - b.y;

    return Math.hypot(dx, dy);
  }
}

const p1 = new Point(5, 5);
const p2 = new Point(10, 10);
p1.displayName; // undefined
p1.distance; // undefined
p2.displayName; // undefined
p2.distance; // undefined

console.log(Point.displayName); // "Point"
console.log(Point.distance(p1, p2)); // 7.0710678118654755

for (const thing of [0, 1, 2, 3]) {
  if (thing === 3) console.log(`We found a ${thing + 5}!`);
  console.error('You messed up!');
  if (thing !== 2) throw new Error("We're done!");
}
