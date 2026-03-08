import {HttpClient} from '@angular/common/http';
import {Task} from '../domain/task';
import {Injectable} from '@angular/core';
import {map, Observable, tap} from 'rxjs';

interface CreateTaskRequest {
    title: string;
    description: string;
    status: {
        name: string;
    };
}

interface TaskResponse {
    uuid: string;
    title: string;
    description: string;
    status: string;
    createdDate: string | null;
}

@Injectable()
export class TaskService {

    private TASK_BASE_URL: string = 'http://localhost:8755/task-service/api/tasks';
    private TASK_GROUP_BASE_URL: string = 'http://localhost:8755/task-service/api/task-statuses';

    constructor(private http: HttpClient) {

    }

    private draggedTask: Task | null | undefined;

    private tasks: Task[] = [];


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

    loadTasks(): Observable<Task[]> {
        return this.http
            .get<TaskResponse[]>(`${this.TASK_BASE_URL}`)
            .pipe(
                map(taskResponses => taskResponses.map(taskResponse => this.toViewTask(taskResponse))),
                tap(tasks => this.tasks = tasks)
            );
    }

    addTask(task: CreateTaskRequest & { priority: Task['priority'] }): Observable<Task> {
        const request: CreateTaskRequest = {
            title: task.title,
            description: task.description,
            status: task.status
        };

        return this.http
            .post<TaskResponse>(`${this.TASK_BASE_URL}`, request)
            .pipe(
                map(taskResponse => this.toViewTask(taskResponse, task.priority)),
                tap(createdTask => this.tasks.push(createdTask))
            );
    }

    setDraggedTask(task: Task | null | undefined) {
        this.draggedTask = task;
    }

    getDraggedTask(): Task | null | undefined {
        return this.draggedTask;
    }

    private toViewTask(taskResponse: TaskResponse, priority: Task['priority'] = 'medium'): Task {
        return {
            id: taskResponse.uuid,
            title: taskResponse.title,
            description: taskResponse.description,
            priority,
            status: taskResponse.status,
            date: this.formatTaskDate(taskResponse.createdDate)
        };
    }

    private formatTaskDate(createdDate: string | null): string {
        const fallbackDate = new Date();
        const parsedDate = createdDate ? new Date(createdDate) : fallbackDate;
        const safeDate = Number.isNaN(parsedDate.getTime()) ? fallbackDate : parsedDate;

        return safeDate.toLocaleDateString('en-US', {month: 'short', day: 'numeric'});
    }
}
