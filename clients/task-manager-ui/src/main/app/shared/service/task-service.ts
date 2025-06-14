import {HttpClient} from '@angular/common/http';
import {Task} from '../models/task';
import {Injectable} from '@angular/core';

@Injectable()
export class TaskService {

    constructor(private http: HttpClient) {
    }

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


    updateTask(task: Task): void {
        console.log("Updating task:", task);
    }

    getTasksSize(): number {
        return 0;
    }

    getTasks(status: string): Task[] {
        return this.tasks.filter(task => task.status === status);
    }

    getTaskGroups(): string[] {
        return ['todo', 'in progress', 'completed']
    }
}
