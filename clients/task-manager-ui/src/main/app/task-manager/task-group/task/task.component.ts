import {Component, Input} from '@angular/core';
import {DragDropModule, Draggable} from 'primeng/dragdrop';
import {Task} from '../../../../domain/task';
import {NgClass} from '@angular/common';
import {TaskService} from '../../../../service/task-service';

@Component({
    selector: 'app-task',
    templateUrl: './task.component.html',
    styleUrl: './task.component.sass',
    imports: [
        DragDropModule,
        NgClass
    ],
    standalone: true
})
export class TaskComponent {
    @Input() task!: Task;

    constructor(private taskService: TaskService) {
    }

    onDragStart(event: DragEvent) {
        this.taskService.setDraggedTask(this.task);
    }

}
