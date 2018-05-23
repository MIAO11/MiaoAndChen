import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReadCartoonComponent } from './read-cartoon.component';

describe('ReadCartoonComponent', () => {
  let component: ReadCartoonComponent;
  let fixture: ComponentFixture<ReadCartoonComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReadCartoonComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReadCartoonComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
