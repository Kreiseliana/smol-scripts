`grd -n half_of_context_size -p regex_pattern -r commit_range`

This command could grep all commited newlines in commit range r match against pattern p, with 2*n size of context.

`grd` is equivalent to `grd -n 3 -p "TODO|assert\\\\(0\\\\)" -r HEAD^..HEAD`. 

example output of running `grd -n 3 -p 'fml_t' -r HEAD^^` on some other repositry (highlight not displayed)
```
main.cpp
190   const vector<fml_t*>& get_sub2() const {
191     return data.sub;
192   }
193   fml_t* get_sub21() const {
194     return data.sub[0];
195   }
196
main.cpp
214     fnv_1a(hash, f.data.sub.data(),
215        sizeof(fml_t*) * f.data.sub.size());
216     fnv_1a(hash, f.get_sub2().data(),
217        sizeof(fml_t*) * f.get_sub2().size());
218   return hash;
219 }
220
main.cpp
436     return false;
437   }
438
439   vector<seq_t*> seq_try_apply_logic(seq_t* seq, fml_t* f) {
440     assert(seq->contains(f));
441
442
```
