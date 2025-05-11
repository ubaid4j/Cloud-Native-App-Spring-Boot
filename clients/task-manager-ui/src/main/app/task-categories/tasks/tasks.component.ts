import {Component} from '@angular/core';
import {Task} from '../../shared/models/task';
import {NgForOf} from '@angular/common';
import {TaskComponent} from './task/task.component';
import {Divider} from 'primeng/divider';

@Component({
    selector: 'app-tasks',
    imports: [
        NgForOf,
        TaskComponent,
        Divider
    ],
    templateUrl: './tasks.component.html',
    styleUrl: './tasks.component.sass',
    standalone: true
})
export class TasksComponent {
    tasks: Task[] = [
        {uuid: "1", title: "Task 1", description: "Task 1 description"},
        {uuid: "2", title: "Task 2", description: "Task 2 description"},
        {uuid: "3", title: "Task 3", description: "Task 3 description"},
        {uuid: "4", title: "Task 4", description: "Task 4 description"},
    ];
}
