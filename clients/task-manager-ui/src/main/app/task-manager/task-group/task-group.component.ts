import {Component, Input} from '@angular/core';
import {TaskComponent} from './task/task.component';
import {DragDropModule, Droppable} from 'primeng/dragdrop';
import {Task} from '../../../domain/task';
import {TaskService} from '../../../service/task-service';
import {CommonModule} from '@angular/common';

@Component({
    selector: 'app-task-group',
    templateUrl: './task-group.component.html',
    styleUrl: './task-group.component.sass',
    imports: [
        CommonModule,
        TaskComponent,
        DragDropModule
    ],
    standalone: true
})
export class TaskGroupComponent {

    @Input() status!: string;

    constructor(private taskService: TaskService) {
    }

    onDrop(event: any) {
        const draggedTask: Task | null | undefined = this.taskService.getDraggedTask();
        if (draggedTask) {
            draggedTask.status = this.status!;
            this.taskService.setDraggedTask(null);
        }
    }

    getTaskSize(status: string) {
        return this.taskService.getTasksSize(status);
    }

    getTasks(): Task[] {
        return this.taskService.getTasks(this.status!);
    }


}
