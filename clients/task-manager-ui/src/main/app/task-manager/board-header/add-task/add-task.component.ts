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
import {DragDropModule} from 'primeng/dragdrop';
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
            this.taskService.addTask({
                title: this.newTask.title,
                description: this.newTask.description,
                priority: this.newTask.priority,
                status: {name: 'todo'}
            }).subscribe({
                next: () => {
                    this.onCloseAddTaskComponent.emit(false);
                    this.resetNewTask();
                },
                error: err => console.error('Failed to create task', err)
            });
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
