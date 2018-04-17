import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PageNotFoundComponent } from './error-page/page-not-found.component';

import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {SpinComponent} from './provider/spin/spin.component';
import {SpinService} from './provider/spin/spin.service';

//modules
import  { AppRoutingModule } from './app-routing.module';
import { HeroesComponent } from './heroes/heroes.component';
import { NavComponent } from './components/common/nav/nav.component';
import { SidebarMenuComponent } from './sidebar-menu/sidebar-menu.component';
import { TestComponent } from './components/common/test/test.component';


@NgModule({
  declarations: [
    AppComponent,
    SpinComponent,
    PageNotFoundComponent,
    HeroesComponent,
    NavComponent,
    SidebarMenuComponent,
    TestComponent,
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
