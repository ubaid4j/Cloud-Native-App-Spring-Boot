import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TaskCategoriesComponent } from '../../../../main/app/task-categories/task-categories.component';

describe('TaskCategoriesComponent', () => {
  let component: TaskCategoriesComponent;
  let fixture: ComponentFixture<TaskCategoriesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TaskCategoriesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TaskCategoriesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
