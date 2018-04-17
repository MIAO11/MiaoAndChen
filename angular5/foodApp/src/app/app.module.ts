import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PageNotFoundComponent } from './error-page/page-not-found.component';

import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {SpinComponent} from './provider/spin/spin.component';
import {SpinService} from './provider/spin/spin.service';
import { LoginComponent } from './login/login.component';

//modules
import  { AppRoutingModule } from './app-routing.module';
import { HeroesComponent } from './heroes/heroes.component';


@NgModule({
  declarations: [
    AppComponent,
    SpinComponent,
    LoginComponent,
    PageNotFoundComponent,
    HeroesComponent,
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
