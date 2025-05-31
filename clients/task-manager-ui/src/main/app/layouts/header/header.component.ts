import {Component} from '@angular/core';

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    styleUrl: './header.component.sass'
})
export class HeaderComponent {
    toggleTheme() {
        // Theme toggle functionality can be implemented here
        console.log('Theme toggle clicked');
    }

}
