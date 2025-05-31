import {Component, Input, OnInit} from '@angular/core';
import {Task} from '../../../shared/models/task'
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
        InputTextarea,
        DragDropModule,
        DropdownModule,

    ]
})
export class AddTaskComponent implements OnInit {

    @Input() isVisible = false;

    priorityOptions = [
        { label: 'High', value: 'high' },
        { label: 'Medium', value: 'medium' },
        { label: 'Low', value: 'low' }
    ];


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

            // this.tasks.push(task);
            this.isVisible = false;
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
}
