import {Component, Input} from '@angular/core';
import { SplitterModule } from 'primeng/splitter';
import {TaskGroup} from '../shared/models/task.group';

@Component({
  selector: 'app-task-categories',
  imports: [SplitterModule],
  templateUrl: './task-categories.component.html',
  styleUrl: './task-categories.component.sass'
})
export class TaskCategoriesComponent {
    @Input() taskGroups: TaskGroup[] = [];
}
