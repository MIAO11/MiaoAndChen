import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RecommendIndexComponent } from './recommend-index.component';

describe('RecommendIndexComponent', () => {
  let component: RecommendIndexComponent;
  let fixture: ComponentFixture<RecommendIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RecommendIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RecommendIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
