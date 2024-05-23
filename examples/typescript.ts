import { Component, Input } from '@angular/core';

const THING = 43;
const cool = -1;

enum Things {
    A,
    B,
}

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

    @Input({ required: true }) myInput: string;

    readonly Things = Things;

    doThis() {
        // better alert them!
        window.alert(`doThis: ${this.someValue + THING}`);
    }

    doThat(): number {
        const dx = 6;
        return this.someValue + dx;
    }

    private coolDude(): void {
        console.log("I'm cool");
    }
}
