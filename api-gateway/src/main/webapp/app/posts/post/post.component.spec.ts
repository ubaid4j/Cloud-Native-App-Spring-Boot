import {ComponentFixture, TestBed} from '@angular/core/testing';

import {PostComponent} from './post.component';
import {HttpClientTestingModule} from "@angular/common/http/testing";

describe('PostComponent', () => {
    let component: PostComponent;
    let fixture: ComponentFixture<PostComponent>;

    beforeEach(async () => {
        await TestBed.configureTestingModule({
            imports: [PostComponent, HttpClientTestingModule]
        })
        .compileComponents();
    
        fixture = TestBed.createComponent(PostComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
