import {HttpClient} from '@angular/common/http';
import {Task} from '../model/task';
import {Injectable} from '@angular/core';

@Injectable()
export class TaskService {

    constructor(private http: HttpClient) {
    }

    private tasks: Task[] = [
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
            status: 'in progress',
            date: 'May 31'
        },
        {
            id: '4',
            title: 'Create component library',
            description: 'Build reusable UI components',
            priority: 'high',
            status: 'in progress',
            date: 'May 31'
        },
        {
            id: '5',
            title: 'Setup development environment',
            description: 'Install necessary tools and dependencies',
            priority: 'low',
            status: 'completed',
            date: 'May 31'
        }
    ];


    updateTask(task: Task): void {
        console.log("Updating task:", task);
    }

    getTasksSize(status: string): number {
        return this.tasks.filter(task => task.status === status).length;
    }

    getTasks(status: string): Task[] {
        return this.tasks.filter(task => task.status === status);
    }

    getTaskGroups(): string[] {
        return ['todo', 'in progress', 'completed']
    }

    addTask(task: Task): void {
        this.tasks.push(task);
    }
}
