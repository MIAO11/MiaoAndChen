import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
// import {PageNotFoundComponent} from './error-page/page-not-found.component';
import {HeroesComponent} from './heroes/heroes.component';
import {NavComponent} from './components/common/nav/nav.component';
import {TestComponent} from './components/common/test/test.component';
import { TodayDetailComponent } from './today-detail/today-detail.component';

const routes: Routes = [
  {
    path: 'login',
    loadChildren: 'app/login/login.module#LoginModule'
  },
  { path: 'heroes', component: HeroesComponent },
  { path: 'nav', component: NavComponent },
  { path: 'test', component: TestComponent },
  { path: 'detail/:htmlId', component: TodayDetailComponent },
  // { path: '**', component: PageNotFoundComponent},

];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {
}
