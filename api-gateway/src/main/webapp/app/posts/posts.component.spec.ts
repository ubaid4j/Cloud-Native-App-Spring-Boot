import {ComponentFixture, TestBed} from '@angular/core/testing';

import {PostsComponent} from './posts.component';
import {PostService} from "./post.service";
import {HttpClientTestingModule} from "@angular/common/http/testing";

describe('PostsComponent', () => {
    let component: PostsComponent;
    let fixture: ComponentFixture<PostsComponent>;

    beforeEach(async () => {
        await TestBed.configureTestingModule({
            imports: [PostsComponent, HttpClientTestingModule],
        })
        .overrideTemplate(PostsComponent, '')
        .compileComponents();

        fixture = TestBed.createComponent(PostsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
