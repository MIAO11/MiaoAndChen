import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TodayDetailComponent } from './today-detail.component';

describe('TodayDetailComponent', () => {
  let component: TodayDetailComponent;
  let fixture: ComponentFixture<TodayDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TodayDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TodayDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
