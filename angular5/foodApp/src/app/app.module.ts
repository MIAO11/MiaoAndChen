import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PageNotFoundComponent } from './error-page/page-not-found.component';

import {NgbModule} from '@ng-bootstrap/ng-bootstrap';

import { HttpService } from './provider/http/http.service';
import { homeService } from './provider/biz/homeService';

//modules
import  { AppRoutingModule } from './app-routing.module';
import { HeroesComponent } from './heroes/heroes.component';
import { NavComponent } from './components/common/nav/nav.component';
import { SidebarMenuComponent } from './sidebar-menu/sidebar-menu.component';
import { TestComponent } from './components/common/test/test.component';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { TodayDetailComponent } from './today-detail/today-detail.component';
import { ToastBoxComponent } from './components/common/toast/toast-box.component';
import { ToastComponent } from './components/common/toast/toast.component';
import { ToastService } from './components/common/toast/toast.service';
import { SpinComponent } from './components/common/spin/spin.component';
import { SpinService } from './components/common/spin/spin.service';
import { RecommendIndexComponent } from './recommend-index/recommend-index.component';
import { CartoonDetailComponent } from './cartoon-detail/cartoon-detail.component';
import { ReadCartoonComponent } from './read-cartoon/read-cartoon.component';

@NgModule({
  declarations: [
    AppComponent,
    SpinComponent,
    PageNotFoundComponent,
    HeroesComponent,
    NavComponent,
    SidebarMenuComponent,
    TestComponent,
    TodayDetailComponent,
    ToastBoxComponent,
    ToastComponent,
    RecommendIndexComponent,
    CartoonDetailComponent,
    ReadCartoonComponent,
  ],
  imports: [
    AppRoutingModule,
    NgbModule.forRoot(),
    BrowserModule,
    FormsModule,
    HttpModule,
    HttpClientModule,
    BrowserAnimationsModule,
  ],
  providers: [
    SpinService,
    HttpService,
    ToastService,
    homeService
  ],
  exports: [
    ToastBoxComponent,
    SpinComponent,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
