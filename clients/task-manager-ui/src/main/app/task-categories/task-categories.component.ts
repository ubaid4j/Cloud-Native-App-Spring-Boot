import {Component, Input} from '@angular/core';
import {SplitterModule} from 'primeng/splitter';
import {TaskGroup} from '../shared/models/task.group';
import {NgForOf} from '@angular/common';
import {TasksComponent} from './tasks/tasks.component';
import {Divider} from 'primeng/divider';

@Component({
    selector: 'app-task-categories',
    imports: [SplitterModule, NgForOf, TasksComponent, Divider],
    templateUrl: './task-categories.component.html',
    styleUrl: './task-categories.component.sass',
    standalone: true
})
export class TaskCategoriesComponent {
    @Input() taskGroups: TaskGroup[] = [];
}
