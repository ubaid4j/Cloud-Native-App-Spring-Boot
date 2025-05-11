import {Component, Input} from '@angular/core';
import {Task} from '../../../shared/models/task';
import {Card} from 'primeng/card';

@Component({
    selector: 'app-task',
    templateUrl: './task.component.html',
    styleUrl: './task.component.sass',
    imports: [
        Card
    ],
    standalone: true
})
export class TaskComponent {
    @Input() task: Task|undefined;
}
