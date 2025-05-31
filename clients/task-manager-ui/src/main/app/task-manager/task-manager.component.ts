import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

// PrimeNG Imports
import { CardModule } from 'primeng/card';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { InputTextarea } from 'primeng/inputtextarea';
import { DropdownModule } from 'primeng/dropdown';
import { DragDropModule } from 'primeng/dragdrop';

interface Task {
    id: string;
    title: string;
    description: string;
    priority: 'high' | 'medium' | 'low';
    status: 'todo' | 'progress' | 'done';
    date: string;
}

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
        InputTextarea,
        DropdownModule,
        DragDropModule
    ],
    templateUrl: 'task-manager.component.html',
    styleUrls: ['task-manager.component.sass'],
})
export class TaskManagerComponent implements OnInit {
    tasks: Task[] = [
        {
            id: '1',
            title: 'Create project plan',
            description: 'Define the scope and timeline for the new project',
            priority: 'high',
            status: 'todo',
            date: 'May 31'
        },
        {
            id: '2',
            title: 'Design user interface',
            description: 'Create wireframes for the main screens',
            priority: 'medium',
            status: 'todo',
            date: 'May 31'
        },
        {
            id: '3',
            title: 'Research competitors',
            description: 'Analyze features of similar products in the market',
            priority: 'medium',
            status: 'progress',
            date: 'May 31'
        },
        {
            id: '4',
            title: 'Create component library',
            description: 'Build reusable UI components',
            priority: 'high',
            status: 'progress',
            date: 'May 31'
        },
        {
            id: '5',
            title: 'Setup development environment',
            description: 'Install necessary tools and dependencies',
            priority: 'low',
            status: 'done',
            date: 'May 31'
        }
    ];

    showAddTaskDialog = false;
    newTask: Partial<Task> = {};

    priorityOptions = [
        { label: 'High', value: 'high' },
        { label: 'Medium', value: 'medium' },
        { label: 'Low', value: 'low' }
    ];

    ngOnInit() {
        this.resetNewTask();
    }

    getTasks(status: string): Task[] {
        return this.tasks.filter(task => task.status === status);
    }

    onDragStart(event: any) {
        // Optional: Add visual feedback when dragging starts
    }

    onDrop(event: any, newStatus: 'todo' | 'progress' | 'done') {
        if (event.dragData) {
            const task = event.dragData as Task;
            const taskIndex = this.tasks.findIndex(t => t.id === task.id);
            if (taskIndex !== -1) {
                this.tasks[taskIndex].status = newStatus;
            }
        }
    }

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

            this.tasks.push(task);
            this.showAddTaskDialog = false;
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

    toggleTheme() {
        // Theme toggle functionality can be implemented here
        console.log('Theme toggle clicked');
    }
}
