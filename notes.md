# Notes

#### Four Bar Linkage Model
##### Ari
##### 04102021
Worked out bugs involving how the linkage calculator interpreted the angles I calculated by hand. It seems the angles calculated for the driver and passenger side linkages are correct but there are issues with the h_linkage elongating that is leading me to believe otherwise.

TODO:
- [ ] Finish Git section of docs (showing users how to use git with matlab)
- [ ] Fix bugs with four_linkage_model where h_linkage seems to widen as the driver and passenger side linkages move (this is probably an issue with the how I am calculating the angles)
- [ ] Add checks in four_bar_linkage that checks if values given for linkages is valid
- [ ] Look into the possibility of making four_bar_linkage a function to be used in steering_sim
- [ ] Add wheel width and length, the information gained is useless without knowing if it works with wheels
- [ ] Add collision checks between linkage members and wheels
