import {Component, Input} from '@angular/core';
import {Draggable} from 'primeng/dragdrop';
import {Task} from '../../../shared/model/task';
import {NgClass} from '@angular/common';

@Component({
    selector: 'app-task',
    templateUrl: './task.component.html',
    styleUrl: './task.component.sass',
    imports: [
        Draggable,
        NgClass
    ],
    standalone: true
})
export class TaskComponent {
    @Input() task!: Task;

    onDragStart(event: any) {
        // Optional: Add visual feedback when dragging starts
    }


}
