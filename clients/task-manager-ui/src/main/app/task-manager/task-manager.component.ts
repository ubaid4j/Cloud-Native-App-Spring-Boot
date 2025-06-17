import { Component, OnInit } from '@angular/core';
import {CommonModule, NgFor} from '@angular/common';
import { FormsModule } from '@angular/forms';

// PrimeNG Imports
import { CardModule } from 'primeng/card';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import {Task} from '../../domain/task';
import { DragDropModule } from 'primeng/dragdrop';
import {HeaderComponent} from '../layouts/header/header.component';
import {BoardHeaderComponent} from './board-header/boader-header.component';
import {TaskGroupComponent} from './task-group/task-group.component';
import {TaskService} from '../../service/task-service';
import {Observable} from 'rxjs';



@Component({
    selector: 'app-task-manager',
    standalone: true,
    imports: [
        CommonModule,
        FormsModule,
        CardModule,
        ButtonModule,
        TagModule,
        DialogModule,
        InputTextModule,
        DragDropModule,
        HeaderComponent,
        BoardHeaderComponent,
        TaskGroupComponent
    ],
    providers: [TaskService],
    templateUrl: 'task-manager.component.html',
    styleUrls: ['task-manager.component.sass'],
})
export class TaskManagerComponent implements OnInit {

    private taskGroups: string[] = [];

    constructor(private taskService: TaskService) {
    }

    ngOnInit() {
        this.taskService
            .getTaskGroups()
            .subscribe(taskGroups => this.taskGroups = taskGroups);
    }

    getTaskGroups(): string[] {
        return this.taskGroups;
    }


}
