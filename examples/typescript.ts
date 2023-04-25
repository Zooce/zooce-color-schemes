import { Component } from '@angular/core';

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
}
