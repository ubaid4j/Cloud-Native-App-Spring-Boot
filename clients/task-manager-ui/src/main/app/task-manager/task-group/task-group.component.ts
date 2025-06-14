import {Component, Input} from '@angular/core';
import {TaskComponent} from './task/task.component';
import {Droppable} from 'primeng/dragdrop';
import {Task} from '../../shared/model/task';
import {TaskService} from '../../shared/service/task-service';
import {CommonModule} from '@angular/common';

@Component({
    selector: 'app-task-group',
    templateUrl: './task-group.component.html',
    styleUrl: './task-group.component.sass',
    imports: [
        CommonModule,
        TaskComponent,
        Droppable
    ],
    standalone: true
})
export class TaskGroupComponent {

    @Input() status!: string;

    constructor(private taskService: TaskService) {
    }

    onDrop(event: any) {
        console.log(event);
        if (event.dragData) {
            const task = event.dragData as Task;
            task.status = this.status!;
            this.taskService.updateTask(task);
        }
    }

    getTaskSize(status: string) {
        return this.taskService.getTasksSize(status);
    }

    getTasks(): Task[] {
        return this.taskService.getTasks(this.status!);
    }
}
