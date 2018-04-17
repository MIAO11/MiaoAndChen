import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {PageNotFoundComponent} from './error-page/page-not-found.component';
import {HeroesComponent} from './heroes/heroes.component';

const routes: Routes = [
  { path: 'heroes', component: HeroesComponent },
  { path: '**', component: PageNotFoundComponent}

];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {
}
