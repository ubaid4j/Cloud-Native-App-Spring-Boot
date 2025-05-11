import {Component} from '@angular/core';
import {RouterOutlet} from '@angular/router';
import {TaskCategoriesComponent} from '../task-categories/task-categories.component';
import {TaskGroup} from '../shared/models/task.group';

@Component({
    selector: 'app-root',
    imports: [RouterOutlet, TaskCategoriesComponent],
    templateUrl: './app.component.html',
    styleUrl: './app.component.sass'
})
export class AppComponent {
    title = 'task-manager-ui';

    taskGroups: TaskGroup[] = [
        {name: "Todo"},
        {name: "In Progress"},
        {name: "Completed"}
    ];
}
