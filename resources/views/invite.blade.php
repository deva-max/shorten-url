@extends('layouts.app')  <!-- Extend your main layout -->

@section('content')
    <div class="container">
        <h2>Invite New User</h2>

        <!-- Display success or error messages -->
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @elseif(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <form method="POST" action="{{ route('invite') }}">
            @csrf

            <!-- Email Input -->
            <div class="form-group">

                <label for="email">Name</label>
                <input type="text" name="name" id="name" class="form-control" required value="{{ old('name') }}" placeholder="Enter name">
                
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" class="form-control" required value="{{ old('email') }}" placeholder="Enter email address">

                <!-- Display validation error for email -->
                @error('email')
                    <div class="alert alert-danger mt-2">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Send Invite</button>
        </form>
    </div>
@endsection
