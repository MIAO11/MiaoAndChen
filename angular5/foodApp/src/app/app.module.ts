import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {SpinComponent} from './provider/spin/spin.component';
import {SpinService} from './provider/spin/spin.service';
import { LoginComponent } from './login/login.component';

//modules
import  { AppRoutingModule } from './app-routing.module';


@NgModule({
  declarations: [
    AppComponent,
    SpinComponent,
    LoginComponent,
  ],
  imports: [
    AppRoutingModule,
    NgbModule.forRoot(),
    BrowserModule,
  
  ],
  providers: [
    SpinService,
  ],
  exports: [
    SpinComponent,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
