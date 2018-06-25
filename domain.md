# Domain Concepts

This doc is an overview of the specific language and concepts that
underly the application as it exists in the models. This starts with
how we represent actual people/places that exist in the real world.

## Models

**User**: this represents the information specific to actual people. Their
name, email, etc, so in essence its purely the information regarding
their *account*. Most of the default functionality is nested inside an
`/accounts` folder, but on some occasions (like actual user management
for coaches) this exists in an explicit `users_controller`.

Users can be one of four explicit roles: `:athlete, :coach, :head_coach,
:admin]`, or the implicit "guest" (someone who isn't logged in).

The role tells us how a user can act. To tell us what a user can act on, they can have a "membership" in that other model. Since this is a polymorphic relationship, its stored as "Membershipable" on the user per Rails convention.

Multiple users will need to act on behalf of three separate models
(Athlete, HighSchool, and College). Between a user's role, and what they
have membership in, we can figure out everything we need to determine
whether or not they can do something.

### Membership Models

**Athlete**: this represents the profile of a specific athlete. This
will almost always include a specific User who *is* that athlete, but
coaches/admins will need to act on behalf of an Athlete, too.

* Athletes can have an "owner" -> this is represented in
  `app/models/concerns/ownable`. There's an `owner_id` that points to a
specific user.

**High School**: this represents the profile of a specific high school.
Coaches and admins are able to act on behalf of a high school.

**College**: this represents the profile of a specific, actual college.
Coaches and admins are able to act on behalf of a high school.

Both High Schools and Coaches can have two kinds of users: coaches, and
head coaches.

### Relationships

Information about the relationships between the membership models are stored in
the Connection model. So these phrases refer to the connections of a
given model:

**High School Roster**
**College Recruitment Board**

A **Connection:** has two sides: the "Athlete", and the "Organization" (a
High School or a College). This is how High Schools manage their
rosters, and how Colleges manage their recruitment. Each side can approve or reject a specific
connection, so they can exist in a variety of states depending on who
said "Yes" or "No."

Relevant info about a connection depends on who's looking at it, so to
  account for this, you need to set a "Perspective" to display
them correctly. This will set up a "connectee" and a "connected"

Say you're looking at an Athlete's profile. This means:
* connectee -> this would be the athlete.
* connected -> this would be the organization they're connected with

### Notifications

Any time a user does something other users should know about, this
creates a "Notification." Notifications are specific to each user, so
multiple users can view and consume notifications about the same event
separately. But remember: multiple users can act on behalf
of each Membership Model. So notifications are between users, but
what determines thsoe users is scoped to the relevant membership models.

Ex: One college coach decides to create a connection with an athlete.
Who should be notified?

* all the other coaches of that college
* the athlete

Notifications are created using observers. So Connections are monitored,
and when one is created or updated, the ConnectionObserver will trigger
and create all the relevant notifications for the relevant users.

### Stats

Athletes need to be able to store and edit their stats. Their coaches
need to be able to do this for their athletes, too. Stats all have some
universal info:

* What position?
* What season?
* What athlete?

(not at the time of this writing, but likely:)
* Is the stat approved as accurate?

But, since each position has its own set of relevant stats, we have to
break this out and get super granular so we can validate everything.

**Stat**: this is simply a join table between an athlete and stats for
a given position.

It also serves as a "gateway" model in that we can
do all "stat management" in the "stats_controller" even though its for a
variety of positions, since all we have to do is swap out the attributes
that are different between each position (aka, the "stat_attributes").

**Position::{Name}**: Located in the `app/models/position` folder, each
is responsible for storing the numbers relevant to the position and the
season those numbers occurred in.


<hr/>

Other potential topics:

* Stat Board
* Onboarding
* Going in depth into each membership model
