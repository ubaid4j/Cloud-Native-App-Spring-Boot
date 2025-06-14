import {Component} from '@angular/core';
import {TaskManagerComponent} from './task-manager/task-manager.component';

@Component({
    selector: 'app-root',
    imports: [TaskManagerComponent],
    templateUrl: './app.component.html',
    styleUrl: './app.component.sass'
})
export class AppComponent {
    title = 'task-manager-ui';
}
