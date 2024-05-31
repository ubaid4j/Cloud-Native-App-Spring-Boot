import {Component, Input} from '@angular/core';
import {CardModule} from 'primeng/card';
import {ButtonModule} from "primeng/button";

@Component({
    selector: 'app-post',
    standalone: true,
    imports: [CardModule, ButtonModule],
    templateUrl: './post.component.html',
    styleUrl: './post.component.css'
})
export class PostComponent {
    @Input() header = '';
    @Input() createdBy = '';
    @Input() content = '';
}
