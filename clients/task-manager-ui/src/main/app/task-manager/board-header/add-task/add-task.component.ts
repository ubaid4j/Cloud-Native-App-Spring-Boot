import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {Task} from '../../../../domain/task'
import {DropdownModule} from 'primeng/dropdown';
import {CommonModule} from '@angular/common';
import {FormsModule} from '@angular/forms';
import {CardModule} from 'primeng/card';
import {ButtonModule} from 'primeng/button';
import {TagModule} from 'primeng/tag';
import {DialogModule} from 'primeng/dialog';
import {InputTextModule} from 'primeng/inputtext';
import {InputTextarea} from 'primeng/inputtextarea';
import {DragDropModule} from 'primeng/dragdrop';
import {HeaderComponent} from '../../../layouts/header/header.component';
import {BoardHeaderComponent} from '../boader-header.component';
import {TaskService} from '../../../../service/task-service';

@Component({
    selector: 'app-add-task',
    templateUrl: './add-task.component.html',
    styleUrl: './add-task.component.sass',
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
        DropdownModule,

    ]
})
export class AddTaskComponent implements OnInit {

    @Input() isVisible = false;
    @Output() onCloseAddTaskComponent = new EventEmitter<boolean>();

    priorityOptions = [
        { label: 'High', value: 'high' },
        { label: 'Medium', value: 'medium' },
        { label: 'Low', value: 'low' }
    ];

    constructor(private taskService: TaskService) {
    }

    ngOnInit() {
        this.resetNewTask();
    }

    newTask: Partial<Task> = {};

    addTask() {
        if (this.newTask.title && this.newTask.description && this.newTask.priority) {
            const task: Task = {
                id: Date.now().toString(),
                title: this.newTask.title,
                description: this.newTask.description,
                priority: this.newTask.priority,
                status: 'todo',
                date: 'May 31'
            };

            this.taskService.addTask(task);
            this.onCloseAddTaskComponent.emit(false);
            this.resetNewTask();
        }
    }

    resetNewTask() {
        this.newTask = {
            title: '',
            description: '',
            priority: 'medium'
        };
    }

    onDialogHide() {
        this.onCloseAddTaskComponent.emit(false);
    }
}
