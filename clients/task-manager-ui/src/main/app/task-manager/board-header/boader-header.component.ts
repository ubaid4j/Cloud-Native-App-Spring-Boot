import {Component} from '@angular/core';
import {AddTaskComponent} from './add-task/add-task.component';

@Component({
    selector: 'app-board-header',
    templateUrl: './board-header.component.html',
    imports: [
        AddTaskComponent
    ],
    styleUrl: './board-header.component.sass'
})
export class BoardHeaderComponent {
    showAddTaskDialog = false;


    closeAddTaskDialog(): void {
        this.showAddTaskDialog = false;
    }

}
