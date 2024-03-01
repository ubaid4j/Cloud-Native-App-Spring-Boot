import {ComponentFixture, TestBed} from '@angular/core/testing';
import {AppComponent} from './app.component';

describe('AppComponent', () => {
    let component: AppComponent;
    let fixture: ComponentFixture<AppComponent>;
    
    beforeEach(async () => {
       await TestBed.configureTestingModule({
          imports: [
              AppComponent
          ] 
       }).compileComponents();
    });
    
    beforeEach(() => {
        fixture = TestBed.createComponent(AppComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    })
    
    it('should create the app', () => {
       expect(component).toBeTruthy(); 
    });
    
    it('should have a title "The Social Platform"', () => {
       expect(component.title).toEqual('The Social Platform'); 
    });
});