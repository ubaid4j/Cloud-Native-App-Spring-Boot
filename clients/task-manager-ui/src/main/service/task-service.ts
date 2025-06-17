import {HttpClient} from '@angular/common/http';
import {Task} from '../domain/task';
import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';

@Injectable()
export class TaskService {

    private TASK_BASE_URL: string = 'http://localhost:8755/task-service/api/tasks';
    private TASK_GROUP_BASE_URL: string = 'http://localhost:8755/task-service/api/task-statuses';

    constructor(private http: HttpClient) {

    }

    private draggedTask: Task | null | undefined;

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

    getTaskGroups(): Observable<string[]> {
        return this.http.get<string[]>(`${this.TASK_GROUP_BASE_URL}`);
        // return ['todo', 'in progress', 'completed']
    }

    addTask(task: Task): void {
        this.tasks.push(task);
    }

    setDraggedTask(task: Task | null | undefined) {
        this.draggedTask = task;
    }

    getDraggedTask(): Task | null | undefined {
        return this.draggedTask;
    }
}
