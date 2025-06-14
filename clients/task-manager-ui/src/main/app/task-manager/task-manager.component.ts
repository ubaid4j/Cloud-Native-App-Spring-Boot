import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

// PrimeNG Imports
import { CardModule } from 'primeng/card';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import {Task} from '../shared/models/task';
import { DragDropModule } from 'primeng/dragdrop';
import {HeaderComponent} from '../layouts/header/header.component';
import {BoardHeaderComponent} from './board-header/boader-header.component';
import {TaskGroupComponent} from './task-group/task-group.component';
import {TaskService} from '../shared/service/task-service';



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

    constructor(private taskService: TaskService) {
    }

    ngOnInit() {
    }

    getTaskGroups(): string[] {
        return this.taskService.getTaskGroups();
    }


}
