@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Dashboard</h1>

    @if (auth()->user()->isAdmin())
        <h2>Team Members</h2>
        

        <form method="POST" action="{{ route('invite') }}">
            @csrf
            <select name="member">
                <option disabled selected value="">Select a Candidate</option>
                    @foreach($members as $member)
                        <option value="{{ $member->id }}">{{ $member->email }}</option>
                    @endforeach
            </select>
            <button type="submit">Send Invite</button>
        </form>
    @endif

    <h2>Short URLs</h2>
    <ul>
        @foreach ($shortUrls as $url)
            <li>
                <a href="{{ $url->long_url }}" target="_blank">{{ $url->short_url }}</a>
            </li>
        @endforeach
    </ul>
</div>
@endsection
