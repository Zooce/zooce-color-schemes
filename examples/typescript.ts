import { Component } from '@angular/core';

const THING = 43;
const cool = -1;

/**
 * Just a thing!
 */
@Component({
    selector: 'app-thing',
    templateUrl: './thing.component.html',
    styleUrls: ['./thing.component.scss']
})
export class ThingComponent {
    someValue = 5;

    doThis() {
        // better alert them!
        window.alert(`doThis: ${this.someValue}`);
    }

    doThat(): number {
        return this.someValue;
    }

    private coolDude(): void {
        console.log("I'm cool");
    }
}
